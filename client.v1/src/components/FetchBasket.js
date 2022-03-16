import { AppContext } from './AppContext.js'
import { fetchBasket } from '../http/basketAPI.js'
import { useContext, useEffect, useState } from 'react'
import { Spinner } from 'react-bootstrap'

const FetchBasket = (props) => {
    const { basket } = useContext(AppContext)
    const [fetching, setFetching] = useState(true)

    useEffect(() => {
        fetchBasket()
            .then(
                data => basket.products = data.products
            )
            .finally(
                () => setFetching(false)
            )
    }, [])

    if (fetching) {
        return <Spinner animation="border" variant="light" />
    }

    return props.children
}

export default FetchBasket