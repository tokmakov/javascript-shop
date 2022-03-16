import { Modal, Button, Form } from 'react-bootstrap'
import { fetchCategory, updateCategory } from '../http/catalogAPI.js'
import { useState, useEffect } from 'react'

const UpdateCategory = (props) => {
    const { id, show, setShow, setChange } = props

    const [name, setName] = useState('')
    const [valid, setValid] = useState(null)

    useEffect(() => {
        if(id) {
            fetchCategory(id)
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
            updateCategory(id, data)
                .then(
                    data => {
                        // закрываем модальное окно редактирования категории
                        setShow(false)
                        // изменяем состояние, чтобы обновить список категорий
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
                <Modal.Title>Редактирование категории</Modal.Title>
            </Modal.Header>

            <Modal.Body>
                <Form noValidate onSubmit={handleSubmit}>
                    <Form.Control
                        name="name"
                        value={name}
                        onChange={e => handleChange(e)}
                        isValid={valid === true}
                        isInvalid={valid === false}
                        placeholder="Название категории..."
                        className="mb-3"
                    />
                    <Button type="submit">Сохранить</Button>
                </Form>
            </Modal.Body>
        </Modal>
    )
}

export default UpdateCategory