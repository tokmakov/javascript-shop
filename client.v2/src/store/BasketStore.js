import { makeAutoObservable } from 'mobx'

class BasketStore {
    _products = []

    constructor() {
        makeAutoObservable(this)
    }

    get products() {
        return this._products
    }

    get count() { // всего позиций в корзине
        return this._products.length
    }

    get sum() { // стоимость всех товаров корзины
        return this._products.reduce((sum, item) => sum + item.price * item.quantity, 0)
    }

    set products(products) {
        this._products = products
    }
}

export default BasketStore