class Graph
  def initialize(all_elements)
    @elements = all_elements
    @n = all_elements.length
  end

  def tug_of_war
    @sol = Array.new(@n, false)
    @selected = Array.new(@n, false)
    @min_diff = 9999999
    @sum = @elements.sum
    @current_sum = 0
    @no_of_selected_elements = 0
    tug_of_war_util(0)
  end

  def tug_of_war_util(current_position)
    return if current_position == @n
    return if (@n/2 - @no_of_selected_elements) > (@n - current_position)
    
    tug_of_war_util(current_position + 1)
    
    @no_of_selected_elements += 1
    @current_sum += @elements[current_position]
    @selected[current_position] = true
    if @no_of_selected_elements == @n/2
      if (@sum/2 - @current_sum).abs < @min_diff
        @min_diff = (@sum/2 - @current_sum).abs
        @selected.each_with_index do |element, index|
          @sol[index] = element
        end
      end
    else
      tug_of_war_util(current_position + 1)
    end
    @selected[current_position] = false
    @no_of_selected_elements -= 1
  end

  def print_sollution
    @sol.each_with_index do |element, index|
      next unless element
      
      puts @elements[index]
    end
  end
end
  
all_elements = gets.split(' ').map(&:to_i) 
graph = Graph.new(all_elements)

graph.tug_of_war
graph.print_sollution