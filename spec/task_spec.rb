require('spec_helper')

describe(Task) do

  describe (Task) do
    describe("#list") do
      it("tells which list it belongs to") do
        list = List.create(name: "list")
        task = Task.create(description: "task", list_id: list.id)
        expect(task.list).to(eq(list))
      end
    end

      it('validates the presence of description') do
        task = Task.new({:description => ''})
        expect(task.save).to(eq(false))
      end

      it('ensures the length of description is at most 50 characters') do
        task = Task.new({:description => 'a'.*(51)})
        expect(task.save).to(eq(false))
      end

  describe('.not_done') do
    it('returns the not done tasks') do
      not_done_task1 = Task.create({:description => 'get it done', :done => false})
      not_done_task2 = Task.create({:description => 'get this done too', :done => false})
      not_done_tasks = [not_done_task1, not_done_task2]
      done_task = Task.create({:description => "done task", :done => true})
      expect(Task.not_done).to(eq(not_done_tasks))
      end
    end
  end
end
