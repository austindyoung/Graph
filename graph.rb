load 'Stack.rb'

class Graph

  attr_accessor :vertices, :edges

  def initialize(opt = {:vertices => [], :edges => []})
    @vertices = opt[:vertices]
    @edges = opt[:edges]
  end

  def add_vertex(new_vertex, other_vertex = nil)
    if vertices.include?(new_vertex)
      raise "vertex already included"
    elsif other_vertex
      new_vertex.neighbors << other_vertex
      other_vertex.neighbors << new_vertex
      vertices << new_vertex
    else
      vertices << new_vertex
    end
  end

  def connect(left, right, direction = nil)
    if vertices.include?(left) && vertices.include?(right)
      edges << Edge.new(:left => left, :right => right, :direction => direction)
      left.neighbors << right
      right.neighbors << left
    else
      raise "some vertex not present"
    end
  end

end

class Vertex

  attr_accessor :value, :visited, :neighbors

  def initialize(opt = { :value => nil, :visited => false, :neighbors => [] })
    @value = opt[:value]
    @visited = opt[:visited]
    @neighbors = opt[:neighbors]
  end

end

class Edge

  attr_accessor :left, :right, :direction

  def initialize(opt = {:left => Vertex.new, :right => Vertex.new, :direction => nil})
    @left = opt[:left]
    @right = opt[:right]
    @direction = opt[:direction]
  end

end
