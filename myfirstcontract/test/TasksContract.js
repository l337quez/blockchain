const TasksContract = artifacts.require("TasksContract");

contract("TasksContract", () => {

    // Deployamos nuestro contracto
    before(async ()=>{
        this.TasksContract = await TasksContract.deployed()
    })


    /*  
    * Primer Test. Comprobar si el contracto se ha desplegado
    **  El address es un Hash no puede ser nulo ni undefined... 
    */
    it('migrate deployed succesfully', async ()=>{
        const address = this.TasksContract.address
        assert.notEqual(address, null);
        assert.notEqual(address, undefined);
        assert.notEqual(address, 0x0);
        assert.notEqual(address, "");
    })


    /*  
    * Segundo Test. Obtener la lista de tareas
    */
    it('get Tasks List', async ()=>{
        const tasksCounter = await this.TasksContract.taskCounter()
        const task = await this.TasksContract.tasks(tasksCounter)

        assert.equal(task.id.toNumber(), tasksCounter)
        assert.equal(task.title, "mi primer tarea")
        assert.equal(task.description, "tengo que hacer algo")
        assert.equal(task.done, false)
        assert.equal(tasksCounter, 1)
    })


    /*  
    * Tercer Test. Comprobar si el crear tareas funciona
    */
    it('task created successfully', async ()=>{
        const tasksCounter = await this.TasksContract.taskCounter()
        const task = await this.TasksContract.tasks(tasksCounter)

        assert.equal(task.id.toNumber(), tasksCounter)
        assert.equal(task.title, "mi primer tarea")
        assert.equal(task.description, "tengo que hacer algo")
        assert.equal(task.done, false)
        assert.equal(tasksCounter, 1)
    })


    /*  
    * Cuarto Test. Comprobar el estado de done.
    */
    it('task toggle done', async ()=>{
        const result = await this.TasksContract.toggleDone(1);
        const taskEvent = result.logs[0].args;
        const task = await this.TasksContract.tasks(1);

        assert.equal(task.done, true);
        /* assert.equal(taskEvent.id.toNumber(), 1);
        assert.equal(taskEvent.done, true); */


    });


})

