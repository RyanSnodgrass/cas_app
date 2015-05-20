class Person
  include Neo4j::ActiveNode
  property :name
  has_many :in, :posts, origin: :author
  has_many :in, :comments, origin: :author
end