import { guestInstance, authInstance } from './index.js'

/*
 * только для администратора магазина
 */

// создать новый заказ
export const adminCreate = async (body) => {
    const { data } = await authInstance.post('order/admin/create', body)
    return data
}
// получить список всех заказов магазина
export const adminGetAll = async () => {
    const { data } = await authInstance.get('order/admin/getall')
    return data
}
// получить список заказов пользователя
export const adminGetUser = async (id) => {
    const { data } = await authInstance.get(`order/admin/getall/user/${id}`)
    return data
}
// получить заказ по id
export const adminGetOne = async (id) => {
    const { data } = await authInstance.get(`order/admin/getone/${id}`)
    return data
}
// удалить заказ по id
export const adminDelete = async (id) => {
    const { data } = await authInstance.delete(`order/admin/delete/${id}`)
    return data
}

/*
 * для авторизованного пользователя
 */

// создать новый заказ
export const userCreate = async (body) => {
    const { data } = await authInstance.post('order/user/create', body)
    return data
}
// получить список всех заказов пользователя
export const userGetAll = async () => {
    const { data } = await authInstance.get('order/user/getall')
    return data
}
// получить один заказ пользователя
export const userGetOne = async (id) => {
    const { data } = await authInstance.get(`order/user/getone/${id}`)
    return data
}

/*
 * для неавторизованного пользователя
 */

// создать новый заказ
export const guestCreate = async (body) => {
    const { data } = await guestInstance.post('order/guest/create', body)
    return data
}
