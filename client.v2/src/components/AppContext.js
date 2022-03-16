import React from 'react'
import CatalogStore from '../store/CatalogStore.js'
import UserStore from '../store/UserStore.js'
import BasketStore from '../store/BasketStore.js'

const AppContext = React.createContext()

// контекст, который будем передавать
const context = {
    user: new UserStore(),
    catalog: new CatalogStore(),
    basket: new BasketStore(),
}

const AppContextProvider = (props) => {
    return (
        <AppContext.Provider value={context}>
            {props.children}
        </AppContext.Provider>
    );
}

export {AppContext, AppContextProvider}