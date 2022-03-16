import { Row, Pagination } from 'react-bootstrap'
import ProductItem from './ProductItem.js'
import { useContext } from 'react'
import { AppContext } from './AppContext.js'
import { observer } from 'mobx-react-lite'
import { useNavigate, createSearchParams } from 'react-router-dom'

const ProductList = observer(() => {
    const { catalog } = useContext(AppContext)
    const navigate = useNavigate()

    const handleClick = (page) => {
        catalog.page = page
        // при каждом клике добавляем в историю браузера новый элемент
        const params = {}
        if (catalog.category) params.category = catalog.category
        if (catalog.brand) params.brand = catalog.brand
        if (catalog.page > 1) params.page = catalog.page
        navigate({
            pathname: '/',
            search: '?' + createSearchParams(params),
        })
    }

    const pages = []
    for (let page = 1; page <= catalog.pages; page++) {
        pages.push(
            <Pagination.Item
                key={page}
                active={page === catalog.page}
                activeLabel=""
                onClick={() => handleClick(page)}
            >
                {page}
            </Pagination.Item>
        )
    }

    return (
        <>
            <Row className="mb-3">
                {catalog.products.length ? (
                    catalog.products.map(item =>
                        <ProductItem key={item.id} data={item} />
                    )
                ) : (
                    <p className="m-3">По вашему запросу ничего не найдено</p>
                )}
            </Row>
            {catalog.pages > 1 && <Pagination>{pages}</Pagination>}
        </>
    )
})

export default ProductList