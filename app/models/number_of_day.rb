class NumberOfDay< ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '1~2"日で発送' },
    { id: 3, name: '2~3"日で発送' },
    { id: 4, name: '4~7"日で発送' }
  ]

  include ActiveHash::Associations
  has_many :items
  
  end