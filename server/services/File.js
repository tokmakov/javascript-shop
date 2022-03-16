import * as uuid from 'uuid'
import * as path from 'path'
import fs from 'fs'

class File {
    save(file) {
        if (!file) return null
        const [, ext] = file.mimetype.split('/')
        const fileName = uuid.v4() + '.' + ext
        const filePath = path.resolve('static', fileName)
        file.mv(filePath)
        return fileName
    }
    delete(file) {
        if (file) {
            const filePath = path.resolve('static', file)
            if (fs.existsSync(filePath)) {
                fs.unlinkSync(filePath)
            }
        }
    }
}

export default new File()