import { makeAutoObservable } from 'mobx'

class UserStore {
    id = null
    email = null
    isAuth = false
    isAdmin = false

    constructor() {
        makeAutoObservable(this)
    }

    login({id, email, role}) {
        this.id = id
        this.email = email
        this.isAuth = true
        this.isAdmin = role === 'ADMIN'
    }

    logout() {
        this.id = null
        this.email = null
        this.isAuth = false
        this.isAdmin = false
    }
}

export default UserStore