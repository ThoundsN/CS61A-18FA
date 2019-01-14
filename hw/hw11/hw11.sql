CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;

-------------------------------------------------------------
-- PLEASE DO NOT CHANGE ANY SQL STATEMENTS ABOVE THIS LINE --
-------------------------------------------------------------

-- The size of each dog
CREATE TABLE size_of_dogs AS
	SELECT a.size, b.name FROM sizes AS a, dogs AS b WHERE a.min < b.height and b.height<= a.max;
  
  
-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT b.child from dogs as a, parents as b where a.name = b.parent order by -a.height ;

-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT a.child as first, b.child as second from parents as a, parents as b where a.parent = b.parent and a.child < b.child;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT first || ' and '|| second ||' are ' ||b.size ||' siblings' as sentence from siblings , size_of_dogs as a, 
  size_of_dogs as b where first = a.name  and second = b.name  and a.size = b.size ;

-- Ways to stack 4 dogs to a height of at least 170, ordered by total height
CREATE TABLE stacks_helper(dogs, stack_height, last_height);

insert into stacks_helper(dogs, stack_height, last_height)
	select name, height, height 
	from dogs;
	
insert into stacks_helper(dogs, stack_height, last_height)
			select dogs || ', ' || name, stack_height + height, height 
			from dogs, stacks_helper
			where height > last_height;
			
insert into stacks_helper(dogs, stack_height, last_height)
			select dogs || ', ' || name, stack_height + height, height 
			from dogs, stacks_helper
			where height > last_height;

insert into stacks_helper(dogs, stack_height, last_height)
			select dogs || ', ' || name, stack_height + height, height 
			from dogs, stacks_helper
			where height > last_height;
			
			
-- Add your INSERT INTOs here


CREATE TABLE stacks AS
  SELECT dogs, stack_height 
  from stacks_helper 
  where stack_height > 170 order by stack_height ;
