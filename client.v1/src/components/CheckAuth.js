import { AppContext } from './AppContext.js'
import { check } from '../http/userAPI.js'
import { useContext, useEffect, useState } from 'react'
import { Spinner } from 'react-bootstrap'

const CheckAuth = (props) => {
    const { user } = useContext(AppContext)
    const [checking, setChecking] = useState(true)
    
    useEffect(() => {
        check()
            .then(data => {
                if (data) {
                    user.login(data)
                }
            })
            .finally(
                () => setChecking(false)
            )
    }, [])

    if (checking) {
        return <Spinner animation="border" variant="light" />
    }

    return props.children
}

export default CheckAuth