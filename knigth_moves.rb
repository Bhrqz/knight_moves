class Node
  attr_accessor :data, :child1, :child2, :child3, :child4, :child5, :child6, :child7, :child8, 

  def initialize(data=nil)
    @data = data
    @child1 = child1
    @child2 = child2
    @child3 = child3
    @child4 = child4
    @child5 = child5
    @child6 = child6
    @child7 = child7
    @child8 = child8

  end

  def arr
    arr = []
    arr << @child1
    arr << @child2
    arr << @child3
    arr << @child4
    arr << @child5
    arr << @child6
    arr << @child7
    arr << @child8

    arr
  end

end

class Knight
  #attr_accessor :board

  MOVES = [-2, -1, 1, 2].permutation(2).to_a.filter {|num| (num[0] * num[1]).abs == 2 }

  def initialize 
    @board = Array.new(8) {Array.new(8)}
    @@counter = 0
  end 
  
  def possible_moves_tree(current, finish)
    #start = @board[current.first][current.last]
    children_queue = []
    position = Node.new 
    position.data = current if valid?(current)
    #Crear hijos a partir del start, son maximo 8, minimo 2.
    MOVES.each do |num|
      x = position.data.first + num.first 
      y = position.data.last + num.last
      children_queue << [x,y]
      children_queue.sort
    end
    pp children_queue #just checking

    making_child(position, children_queue)

    pp position #just checkin 

    arrived?(position, finish)
    pp arrived?(position, finish) #JUST checkin the arrived outcome
  
    new_path(position, finish)
  pp position
  end
  
  def new_path(position,finish)
    queue = []
    arr = position.arr
    arr = arr.compact
    pp "arr es #{arr}" #just checking

    arr.each do |n|
      if n.first >= finish.first  
        queue << n
      elsif n.last == finish.last 
        queue << n
      elsif n.first
      end
      
    end
    pp queue
    pp "newpath es #{queue.last}"
    possible_moves_tree(queue.last,finish)
  end

  def making_child(position, children_queue)
    for i in (0..7)
      if valid?(children_queue[i]) 
        if !position.child1
          position.child1 = children_queue[i]
        elsif !position.child2
          position.child2 = children_queue[i]
        elsif !position.child3
          position.child3 = children_queue[i]
        elsif !position.child4
          position.child4 = children_queue[i]
        elsif !position.child5
          position.child5 = children_queue[i]
        elsif !position.child6
          position.child6 = children_queue[i]
        elsif !position.child7
          position.child7 = children_queue[i]
        elsif !position.child8
          position.child8 = children_queue[i]
        else
          skip
        end
        
      end
      
    end
  end

  def valid?(arg)
     (arg.first < 9 && arg.first > 0) && (arg.last > 0 && arg.last < 9)
  end

  def arrived?(position, finish)
   
     position.arr.each do |arr|
      @@counter +=1
      #return true if arr == finish
      done() if arr == finish
     end 
     false
  end

  def done
    pp "Number of moves: #{@@counter}"
    exit

  end

end

def knight_moves(current, finish)
  
  knight = Knight.new  
  knight.possible_moves_tree(current, finish)
end



knight_moves([4, 3], [5,8])

#Osea, la root del arbol sera la posicion inicial,
#luego, los hijos seran todos los movimientos posibles desde ahi
#checar si entre los hijos esta el GOAL
#si no esta, ver cual de los hijos es el que mas se le acerca
#usando algunos de los BST methods