import express from 'express'
import CategoryController from '../controllers/Category.js'
import authMiddleware from '../middleware/authMiddleware.js'
import adminMiddleware from '../middleware/adminMiddleware.js'

const router = new express.Router()

router.get('/getall', CategoryController.getAll)
router.get('/getone/:id([0-9]+)', CategoryController.getOne)
router.post('/create', /*authMiddleware, adminMiddleware,*/ CategoryController.create)
router.put('/update/:id([0-9]+)', /*authMiddleware, adminMiddleware,*/ CategoryController.update)
router.delete('/delete/:id([0-9]+)', /*authMiddleware, adminMiddleware,*/ CategoryController.delete)

export default router