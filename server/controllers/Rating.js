import RatingModel from '../models/Rating.js'
import AppError from '../errors/AppError.js'

class Rating {
    async getOne(req, res, next) {
        try {
            const rating = await RatingModel.getOne(req.params.productId)
            res.json(rating)
        } catch(e) {
            next(AppError.badRequest(e.message))
        }
    }

    async create(req, res, next) {
        try {
            const {productId, rate} = req.params
            const rating = await RatingModel.create(req.auth.userId, productId, rate)
            res.json(rating)
        } catch(e) {
            next(AppError.badRequest(e.message))
        }
    }
}

export default new Rating()