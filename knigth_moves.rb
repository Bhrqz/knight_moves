


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

  MOVES = [-2, -1, 1, 2].permutation(2).to_a.filter {|num| (num[0] * num[1]).abs == 2 }

  def initialize 
    @board = Array.new(8) {Array.new(8)}
  end 
  
  def hold(current, finish)
    @@start = current
    @@goal = finish
  end

  def possible_moves_tree(current)
    children_queue = []
    position = Node.new 
    position.data = current if valid?(current)
    #Crear hijos a partir del start, son maximo 8, minimo 2.
    MOVES.each do |num|
      x = position.data.first + num.first 
      y = position.data.last + num.last
      children_queue << [x,y]
    end
    making_child(position, children_queue)
    position
  end
  
  def new_path(position, finish)
    arrived?(position.data, finish) 
    main = []
    @@record = []
    
    main << position.data
    while main
      arrived?(main[0], finish)
      node = possible_moves_tree(main[0])
      
      node.arr.each do |arr|
        main << arr 
        main = main.compact
      end

      @@record << main[0]
      main.shift
    
    end

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
   
     if position== finish
      done(finish) 
     end 
     false
  end

  def done(finish)
    counter = 0
    final_record = []
      hash = Hash.new

      for i in 0..@@record.length-1 do 
       
      hash[@@record[i]] = possible_moves_tree(@@record[i]).arr.compact
      end
    while finish != @@start
      hash.each do |k, arr|
        if arr.include?(finish)
          counter +=1
          final_record << k
          break
        end

      end
      finish = final_record.last
    end
    print "Done in #{counter} moves \nThis is your path \n#{final_record.reverse}, #{@@goal}\n" 
    exit
  end


end

def knight_moves(current, finish)
  
  knight = Knight.new 
  
  knight.hold(current, finish) 
  position = knight.possible_moves_tree(current)

  knight.new_path(position, finish) 

end



knight_moves([1,1], [1,2])

