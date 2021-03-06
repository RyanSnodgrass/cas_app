class Post
  include Neo4j::ActiveNode

  property :title
  property :body
  has_many :in, :comments, origin: :post
  has_one :out, :author, type: :author, model_class: Person
  
end