import { Table } from 'react-bootstrap'

const Order = (props) => {
    return (
        <>
            <ul>
                <li>Дата заказа: {props.data.prettyCreatedAt}</li>
                <li>
                    Статус заказа:
                    {props.data.status === 0 && <span>Новый</span>}
                    {props.data.status === 1 && <span>В работе</span>}
                    {props.data.status === 2 && <span>Завершен</span>}
                </li>
            </ul>
            <ul>
                <li>Имя, фамилия: {props.data.name}</li>
                <li>Адрес почты: {props.data.email}</li>
                <li>Номер телефона: {props.data.phone}</li>
                <li>Адрес доставки: {props.data.address}</li>
                <li>Комментарий: {props.data.comment}</li>
            </ul>
            <Table bordered hover size="sm" className="mt-3">
                <thead>
                    <tr>
                        <th>Название</th>
                        <th>Цена</th>
                        <th>Кол-во</th>
                        <th>Сумма</th>
                    </tr>
                </thead>
                <tbody>
                    {props.data.items.map(item => 
                        <tr key={item.id}>
                            <td>{item.name}</td>
                            <td>{item.price}</td>
                            <td>{item.quantity}</td>
                            <td>{item.price * item.quantity}</td>
                        </tr>
                    )}
                    <tr>
                        <td colSpan={3}>Итого</td>
                        <td>{props.data.amount}</td>
                    </tr>
                </tbody>
            </Table>
        </>
    )
}

export default Order