import AppError from '../errors/AppError.js'

const error = (err, req, res, next) => {
    if (err instanceof AppError) {
        console.log(err)
        return res.status(err.status).json({message: err.message})
    }
    return res.status(500).json({message: err.message})
    return res.status(500).json({message: 'Непредвиденная ошибка'})
}

export default error