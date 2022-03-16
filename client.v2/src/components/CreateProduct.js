import { Modal, Button, Form, Row, Col } from 'react-bootstrap'
import { createProduct, fetchCategories, fetchBrands } from '../http/catalogAPI.js'
import { useState, useEffect } from 'react'
import CreateProperties from './CreateProperties.js'

const defaultValue = {name: '', price: '', category: '', brand: ''}
const defaultValid = {name: null, price: null, category: null, brand: null}

const isValid = (value) => {
    const result = {}
    const pattern = /^[1-9][0-9]*$/
    for (let key in value) {
        if (key === 'name') result.name = value.name.trim() !== ''
        if (key === 'price') result.price = pattern.test(value.price.trim())
        if (key === 'category') result.category = pattern.test(value.category)
        if (key === 'brand') result.brand = pattern.test(value.brand)
    }
    return result
}

const CreateProduct = (props) => {
    const { show, setShow, setChange } = props

    const [value, setValue] = useState(defaultValue)
    const [valid, setValid] = useState(defaultValid)

    // выбранное для загрузки изображение товара
    const [image, setImage] = useState(null)

    // список характеристик товара
    const [properties, setProperties] = useState([])

    // список категорий и список брендов для возможности выбора
    const [categories, setCategories] = useState(null)
    const [brands, setBrands] = useState(null)

    // нужно получить с сервера список категорий и список брендов
    useEffect(() => {
        fetchCategories()
            .then(
                data => setCategories(data)
            )
        fetchBrands()
            .then(
                data => setBrands(data)
            )
    }, [])

    const handleInputChange = (event) => {
        const data = {...value, [event.target.name]: event.target.value}
        setValue(data)
        setValid(isValid(data))
    }

    const handleImageChange = (event) => {
        setImage(event.target.files[0])
    }

    const handleSubmit = (event) => {
        event.preventDefault()

        /*
         * На первый взгляд кажется, что переменная correct не нужна, можно обойтись valid, но это
         * не так. Нельзя использовать значение valid сразу после изменения этого значения — ф-ция
         * setValid не изменяет значение состояния мгновенно. Вызов функции лишь означает — React
         * «принял к сведению» наше сообщение, что состояние нужно изменить.
         */
        const correct = isValid(value)
        setValid(correct)

        // все поля формы прошли проверку, можно отправлять данные на сервер
        if (correct.name && correct.price && correct.category && correct.brand) {

            const data = new FormData()
            data.append('name', value.name.trim())
            data.append('price', value.price.trim())
            data.append('categoryId', value.category)
            data.append('brandId', value.brand)
            if (image) data.append('image', image, image.name)
            // характеристики нового товара
            if (properties.length) {
                const props = properties.filter(
                    prop => prop.name.trim() !== '' && prop.value.trim() !== ''
                )
                if (props.length) {
                    data.append('props', JSON.stringify(props))
                }
            }

            createProduct(data)
                .then(
                    data => {
                        // приводим форму в изначальное состояние
                        event.target.image.value = ''
                        setValue(defaultValue)
                        setValid(defaultValid)
                        setProperties([])
                        // закрываем модальное окно создания товара
                        setShow(false)
                        // изменяем состояние, чтобы обновить список товаров
                        setChange(state => !state)
                    }
                )
                .catch(
                    error => alert(error.response.data.message)
                )
        }
    }

    return (
        <Modal show={show} onHide={() => setShow(false)} size="lg">
            <Modal.Header closeButton>
                <Modal.Title>Новый товар</Modal.Title>
            </Modal.Header>

            <Modal.Body>
                <Form noValidate onSubmit={handleSubmit}>
                    <Form.Control
                        name="name"
                        value={value.name}
                        onChange={e => handleInputChange(e)}
                        isValid={valid.name === true}
                        isInvalid={valid.name === false}
                        placeholder="Название товара..."
                        className="mb-3"
                    />
                    <Row className="mb-3">
                        <Col>
                            <Form.Select
                                name="category"
                                value={value.category}
                                onChange={e => handleInputChange(e)}
                                isValid={valid.category === true}
                                isInvalid={valid.category === false}
                            >
                                <option value="">Категория</option>
                                {categories && categories.map(item =>
                                    <option key={item.id} value={item.id}>{item.name}</option>
                                )}
                            </Form.Select>
                        </Col>
                        <Col>
                            <Form.Select
                                name="brand"
                                value={value.brand}
                                onChange={e => handleInputChange(e)}
                                isValid={valid.brand === true}
                                isInvalid={valid.brand === false}
                            >
                                <option value="">Бренд</option>
                                {brands && brands.map(item =>
                                    <option key={item.id} value={item.id}>{item.name}</option>
                                )}
                            </Form.Select>
                        </Col>
                    </Row>
                    <Row className="mb-3">
                        <Col>
                            <Form.Control
                                name="price"
                                value={value.price}
                                onChange={e => handleInputChange(e)}
                                isValid={valid.price === true}
                                isInvalid={valid.price === false}
                                placeholder="Цена товара..."
                            />
                        </Col>
                        <Col>
                            <Form.Control
                                name="image"
                                type="file"
                                onChange={e => handleImageChange(e)}
                                placeholder="Фото товара..."
                            />
                        </Col>
                    </Row>
                    <CreateProperties properties={properties} setProperties={setProperties} />
                    <Row>
                        <Col>
                            <Button type="submit">Сохранить</Button>
                        </Col>
                    </Row>
                </Form>
            </Modal.Body>
        </Modal>
    )
}

export default CreateProduct