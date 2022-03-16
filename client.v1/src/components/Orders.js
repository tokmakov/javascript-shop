import { Table } from 'react-bootstrap'
import { Link } from 'react-router-dom'

const Orders = (props) => {

    if (props.items.length === 0) {
        return <p>Список заказов пустой</p>
    }

    return (
        <Table bordered hover size="sm" className="mt-3">
            <thead>
                <tr>
                    <th>№</th>
                    <th>Дата</th>
                    <th>Покупатель</th>
                    <th>Адрес почты</th>
                    <th>Телефон</th>
                    <th>Статус</th>
                    <th>Сумма</th>
                    <th>Подробнее</th>
                </tr>
            </thead>
            <tbody>
                {props.items.map(item => 
                    <tr key={item.id}>
                        <td>{item.id}</td>
                        <td>{item.prettyCreatedAt}</td>
                        <td>{item.name}</td>
                        <td>{item.email}</td>
                        <td>{item.phone}</td>
                        <td>{item.status}</td>
                        <td>{item.amount}</td>
                        <td>
                            {props.admin ? (
                                <Link to={`/admin/order/${item.id}`}>Подробнее</Link>
                            ) : (
                                <Link to={`/user/order/${item.id}`}>Подробнее</Link>
                            )}
                            
                        </td>
                    </tr>
                )}
            </tbody>
        </Table>
    )
}

export default Orders