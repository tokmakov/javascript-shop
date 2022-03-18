import { Spinner } from 'react-bootstrap'

const Loader = () => {
    const style = {
        width: '100%',
        height: '100vh',
        display: 'flex',
        justifyContent: 'center',
        alignItems: 'center'
    }
    return (
        <div style={style}>
            <Spinner animation="grow" variant="primary" />
        </div>
    )
}

export default Loader