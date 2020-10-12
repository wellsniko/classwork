class PolyTreeNode
    attr_accessor :parent, :children, :value
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    
    
    def parent=(new_parent)
       
        @parent.children.delete(self) if @parent != nil
        @parent = new_parent
        @parent.children << self if new_parent != nil && !@parent.children.include?(self) 
            
    end

    def add_child(new_child)
        new_child.parent = self if !self.children.include?(new_child)
    end

    def remove_child(child)
        raise "node is not a child" if child.parent == nil
        child.parent = nil
    end

    def dfs(target)
        
        return self if self.value == target
        # return nil if self.value != target
        self.children.each do |child|
            result =  child.dfs(target)
            if result != nil
                return result
            end
        end
        return nil
    end

    def bfs(target)
        queue = [self]
        until queue.empty?
            if queue[0].value == target 
                return queue[0]
            else
                queue += queue[0].children
                queue.shift
            end
        end
    end


end

