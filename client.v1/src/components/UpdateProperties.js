import { useEffect, useState } from 'react'
import { Row, Col, Button, Form } from 'react-bootstrap'
import { createProperty, updateProperty, deleteProperty } from '../http/catalogAPI.js'
import uuid from 'react-uuid'

const UpdateProperties = (props) => {
    const { properties, setProperties } = props

    const append = () => {
        setProperties([...properties, {id: null, name: '', value: '', unique: uuid(), append: true}])
    }
    const remove = (unique) => {
        // новую хар-ку надо просто удалить из массива properties, а старую — оставить, но
        // изменить remove на true, чтобы потом выполнить http-запрос на сервер для удаления
        const item = properties.find(elem => elem.unique === unique)
        if (item.id) { // старая хар-ка
            setProperties(properties.map(
                elem => elem.unique === unique ? {...elem, change: false, remove: true} : elem
            ))
        } else { // новая хар-ка
            setProperties(properties.filter(elem => elem.unique === unique))
        }
    }
    const change = (key, value, unique) => {
        setProperties(properties.map(
            item => item.unique === unique ? {...item, [key]: value, change: !item.append} : item
        ))
    }

    return (
        <>
            <h5>Характеристики</h5>
            <Button onClick={append} variant="outline-primary" size="sm" className="mb-2">
                Добавить
            </Button>
            {properties.map(item =>
                <Row key={item.unique} className="mb-2" style={{display: item.remove ? 'none': 'flex'}}>
                    <Col>
                        <Form.Control
                            name={'name_' + item.unique}
                            value={item.name}
                            onChange={e => change('name', e.target.value, item.unique)}
                            placeholder="Название..."
                            size="sm"
                        />
                    </Col>
                    <Col>
                        <Form.Control
                            name={'value_' + item.unique}
                            value={item.value}
                            onChange={e => change('value', e.target.value, item.unique)}
                            placeholder="Значение..."
                            size="sm"
                        />
                    </Col>
                    <Col>
                        <Button onClick={() => remove(item.unique)} size="sm" variant="outline-danger">
                            Удалить
                        </Button>
                        {item.change && ' *'}
                    </Col>
                </Row>
            )}
        </>
    )
}

export default UpdateProperties