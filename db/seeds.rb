# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }) { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel') city: cities.first)
Tag.delete_all
Tag.create( name: 'Food', level: 'default')
Tag.create( name: 'Love', level: 'success')
Tag.create( name: 'Jobs', level: 'primary')
Tag.create( name: 'Language' ,level: 'default')
Tag.create( name: 'House & Room', level: 'primary')
Tag.create( name: 'Buy & Sell', level: 'primary')
Tag.create( name: 'Q & A' ,level:  'info')
Tag.create( name: 'Warning' ,level: 'warning')
Tag.create( name: 'Danger', level: 'danger')



Category.delete_all


Category.create( name: 'Harvard University')
Category.create( name: 'Massachusetts Institute of Technology')
Category.create( name: 'University of Cambridge')
Category.create( name: 'University of Oxford')
Category.create( name: 'University of California) Berkeley')
Category.create( name: 'Stanford University')
Category.create( name: 'Princeton University')
Category.create( name: 'University of California) Los Angeles')
Category.create( name: 'The University of Tokyo')
Category.create( name: 'Yale University')
Category.create( name: 'California Institute of Technology')
Category.create( name: 'University of Michigan')
Category.create( name: 'Columbia University')
Category.create( name: 'University of Chicago')
Category.create( name: 'Imperial College London')
Category.create( name: 'University of Toronto')
Category.create( name: 'Cornell University')
Category.create( name: 'University of Pennsylvania')
Category.create( name: 'Johns Hopkins University  ')
Category.create( name: 'University College London')
Category.create( name: 'ETH Zürich – Swiss Federal Institute of Technology Zürich')
Category.create( name: 'National University of Singapore')
Category.create( name: 'Kyoto University')
Category.create( name: 'University of Illinois at Urbana Champaign')
Category.create( name: 'London School of Economics and Political Science')
Category.create( name: 'Carnegie Mellon University  ')
Category.create( name: 'University of Texas at Austin ')
Category.create( name: 'University of Washington  ')
Category.create( name: 'New York University')
Category.create( name: 'University of Wisconsin-Madison ')
Category.create( name: 'University of British Columbia  ')
Category.create( name: 'Duke University ')
Category.create( name: 'McGill University ')
Category.create( name: 'University of California) San Diego ')
Category.create( name: 'Tsinghua University ')
Category.create( name: 'The University of Hong Kong ')
Category.create( name: 'Northwestern University ')
Category.create( name: 'Georgia Institute of Technology')
Category.create( name: 'University of Melbourne ')
Category.create( name: 'University of California) San Francisco ')
Category.create( name: 'Seoul National University ')
Category.create( name: 'Australian National University  ')
Category.create( name: 'University of Massachusetts ')
Category.create( name: 'Ludwig-Maximilians-Universität München  ')
Category.create( name: 'Peking University ')
Category.create( name: 'University of Edinburgh ')
Category.create( name: 'University of Manchester  ')
Category.create( name: 'University of California Davis ')
Category.create( name: 'University of Sydney  ')
Category.create( name: 'Lomonosov Moscow State University ')
Category.create( name: 'Purdue University ')




