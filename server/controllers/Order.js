import OrderModel from '../models/Order.js'
import BasketModel from '../models/Basket.js'
import UserModel from '../models/User.js'
import AppError from '../errors/AppError.js'

class Order {
    adminCreate = async (req, res, next) => {
        await this.create(req, res, next, 'admin')
    }

    userCreate = async (req, res, next) => {
        await this.create(req, res, next, 'user')
    }

    guestCreate = async (req, res, next) => {
        await this.create(req, res, next, 'guest')
    }

    async create(req, res, next, type) {
        try {
            const {name, email, phone, address, comment = null} = req.body
            // данные для создания заказа
            if (!name) throw new Error('Не указано имя покупателя')
            if (!email) throw new Error('Не указан email покупателя')
            if (!phone) throw new Error('Не указан телефон покупателя')
            if (!address) throw new Error('Не указан адрес доставки')

            let items, userId = null
            if (type === 'admin') {
                // когда заказ делает админ, id пользователя и состав заказа в теле запроса
                if (!req.body.items) throw new Error('Не указан состав заказа')
                if (req.body.items.length === 0) throw new Error('Не указан состав заказа')
                items = req.body.items
                // проверяем существование пользователя
                userId = req.body.userId ?? null
                if (userId) {
                    await UserModel.getOne(userId) // будет исключение, если не найден
                }
            } else {
                // когда заказ делает обычный пользователь (авторизованный или нет), состав
                // заказа получаем из корзины, а id пользователя из req.auth.id (если есть)
                if (!req.signedCookies.basketId) throw new Error('Ваша корзина пуста')
                const basket = await BasketModel.getOne(parseInt(req.signedCookies.basketId))
                if (basket.products.length === 0) throw new Error('Ваша корзина пуста')
                items = basket.products
                userId = req.auth?.id ?? null
            }

            // все готово, можно создавать
            const order = await OrderModel.create({
                name, email, phone, address, comment, items, userId
            })
            // корзину теперь нужно очистить
            await BasketModel.clear(parseInt(req.signedCookies.basketId))
            res.json(order)
        } catch(e) {
            next(AppError.badRequest(e.message))
        }
    }

    async adminGetAll(req, res, next) {
        try {
            const orders = await OrderModel.getAll()
            res.json(orders)
        } catch(e) {
            next(AppError.badRequest(e.message))
        }
    }

    async adminGetUser(req, res, next) {
        try {
            if (!req.params.id) {
                throw new Error('Не указан id пользователя')
            }
            const order = await OrderModel.getAll(req.params.id)
            res.json(order)
        } catch(e) {
            next(AppError.badRequest(e.message))
        }
    }

    async adminGetOne(req, res, next) {
        try {
            if (!req.params.id) {
                throw new Error('Не указан id заказа')
            }
            const order = await OrderModel.getOne(req.params.id)
            res.json(order)
        } catch(e) {
            next(AppError.badRequest(e.message))
        }
    }

    async adminDelete(req, res, next) {
        try {
            if (!req.params.id) {
                throw new Error('Не указан id заказа')
            }
            const order = await OrderModel.delete(req.params.id)
            res.json(order)
        } catch(e) {
            next(AppError.badRequest(e.message))
        }
    }

    async userGetAll(req, res, next) {
        try {
            const orders = await OrderModel.getAll(req.auth.id)
            res.json(orders)
        } catch(e) {
            next(AppError.badRequest(e.message))
        }
    }

    async userGetOne(req, res, next) {
        try {
            if (!req.params.id) {
                throw new Error('Не указан id заказа')
            }
            const order = await OrderModel.getOne(req.params.id, req.auth.id)
            res.json(order)
        } catch(e) {
            next(AppError.badRequest(e.message))
        }
    }
}

export default new Order()