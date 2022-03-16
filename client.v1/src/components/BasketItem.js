import { Button } from 'react-bootstrap'

const BasketItem = (props) => {
    return (
        <tr>
            <td>{props.name}</td>
            <td>
                <Button variant="outline-dark" size="sm" onClick={() => props.decrement(props.id)}>-</Button>
                {' '}<strong>{props.quantity}</strong>{' '}
                <Button variant="outline-dark" size="sm" onClick={() => props.increment(props.id)}>+</Button>
            </td>
            <td>{props.price}</td>
            <td>{props.price * props.quantity}</td>
            <td>
                <Button variant="link" onClick={() => props.remove(props.id)}>
                    Удалить
                </Button>
            </td>
        </tr>
    );
}

export default BasketItem