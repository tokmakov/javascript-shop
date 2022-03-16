import { Modal, Button, Form } from 'react-bootstrap'
import { fetchBrand, updateBrand } from '../http/catalogAPI.js'
import { useState, useEffect } from 'react'

const UpdateBrand = (props) => {
    const { id, show, setShow, setChange } = props

    const [name, setName] = useState('')
    const [valid, setValid] = useState(null)

    useEffect(() => {
        if(id) {
            fetchBrand(id)
                .then(
                    data => setName(data.name)
                )
                .catch(
                    error => alert(error.response.data.message)
                )
        }
    }, [id])

    const handleChange = (event) => {
        setName(event.target.value)
        setValid(event.target.value.trim() !== '')
    }

    const handleSubmit = (event) => {
        event.preventDefault()
        /*
         * На первый взгляд кажется, что переменная correct не нужна, можно обойтись valid, но это
         * не так. Нельзя использовать значение valid сразу после изменения этого значения — ф-ция
         * setValid не изменяет значение состояния мгновенно. Вызов функции лишь означает — React
         * «принял к сведению» наше сообщение, что состояние нужно изменить.
         */
        const correct = name.trim() !== ''
        setValid(correct)
        if (correct) {
            const data = {
                name: name.trim()
            }
            updateBrand(id, data)
                .then(
                    data => {
                        // закрываем модальное окно редактирования бренда
                        setShow(false)
                        // изменяем состояние, чтобы обновить список брендов
                        setChange(state => !state)
                    }
                )
                .catch(
                    error => alert(error.response.data.message)
                )
        }
    }

    return (
        <Modal show={show} onHide={() => setShow(false)}>
            <Modal.Header closeButton>
                <Modal.Title>Редактирование бренда</Modal.Title>
            </Modal.Header>

            <Modal.Body>
                <Form noValidate onSubmit={handleSubmit}>
                    <Form.Control
                        name="name"
                        value={name}
                        onChange={e => handleChange(e)}
                        isValid={valid === true}
                        isInvalid={valid === false}
                        placeholder="Название бренда..."
                        className="mb-3"
                    />
                    <Button type="submit">Сохранить</Button>
                </Form>
            </Modal.Body>
        </Modal>
    )
}

export default UpdateBrand