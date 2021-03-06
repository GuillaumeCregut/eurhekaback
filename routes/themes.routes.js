const router = require("express").Router();
const theme = require('../models/themes.model');

const {checkLevel,checkAdmin}=require('../middleware/UserValidation');
const { restart } = require("nodemon");

router.get('/', async (req,res)=>
{
    //get all categories
    const result=await theme.getAll();
    if(result&&(typeof(result.errno)!=='undefined')){
        return res.sendStatus(500);
    }
    if(result)
        return res.status(200).json(result);
    else
        return res.sendStatus(500);
});

router.get('/admin/', async (req,res)=>
{
    //get all categories
    const result=await theme.getAll();
    if(result&&(typeof(result.errno)!=='undefined')){
        return res.sendStatus(500);
    }
    if(result)
    {
        const tempTheme=[];
        result.forEach((theme)=>{

            let newTheme={
                idTheme:theme.id_theme,
                checked:false,
                themeName:theme.name
            }
            tempTheme.push(newTheme);
        })
        return res.status(200).json(tempTheme);
    }
    else
        return res.sendStatus(500);
});

router.get('/:id',async (req,res)=>
{
    const result=await theme.findOne(req.params.id);
    if(result&&(typeof(result.errno)!=='undefined')){
        return res.sendStatus(500);
    }
    if(result)
        return res.status(200).json(result);
    else
        return res.sendStatus(404);
});
router.post('/',checkLevel,checkAdmin,async (req,res)=>
{
     const errors = theme.validate(req.body);
    if (errors) {
        const errorDetails = errors.details;
        const errorArray = [];
        errorDetails.forEach((error) => {
            errorArray.push(error.message);
        });
        return res.status(422).json(errorArray);
    }
    const newTheme=await theme.create(req.body);
    if(newTheme&& (typeof(newTheme.errno)!=='undefined')){
        return res.sendStatus(500);
    }
    if(newTheme){
        return res.status(201).send('theme created');
    }
    else
    {
        return res.status(500).send('theme not created');
    }

});
router.put('/:id',checkLevel,checkAdmin,async (req,res)=>
{
    const errors = theme.validate(req.body);
    if (errors) {
        const errorDetails = errors.details;
        const errorArray = [];
        errorDetails.forEach((error) => {
            errorArray.push(error.message);
        });
        return res.status(422).json(errorArray);
    }
    //Put to DB
    const updatedTheme=await theme.update(req.params.id,req.body);
    if(updatedTheme&& (typeof(updatedTheme.errno)!=='undefined')){
        return res.sendStatus(500);
    }
    if(updatedTheme===true){
        return res.status(200).send('theme updated');
    }
    else
    {
        return res.status(500).send('theme not updated');
    }

});

router.delete('/:id',checkLevel,checkAdmin,async(req,res)=>
{
    const result=await theme.destroy(req.params.id);
    if(result&&(typeof(result.errno)!=='undefined')){
        return res.sendStatus(500);
    }
    if(result){
        return res.status(200).send('theme deleted');
    }
    else
        return res.status(404).send('theme not found');
});

module.exports = router;