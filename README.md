## globalize3 + paper_trail interaction bug example

There is a bug when trying to use gobalize3 and paper_trail on the same set of attributes. This app is an example.

You can run the unit tests to see the failure or see it in action on the console

```irb
> p = Post.create(:title => 'zoot boot', :content => 'no way!')
   (0.0ms)  begin transaction
  SQL (4.0ms)  INSERT INTO "posts" ...
  Post::Translation Load (0.1ms)  SELECT "post_translations".* FROM "post_translations" WHERE "post_translations"."post_id" = 5 AND "post_translations"."locale" = 'en' LIMIT 1
  SQL (0.3ms)  INSERT INTO "post_translations" ...
 Post::Translation Load (0.1ms)  SELECT "post_translations".* FROM "post_translations" WHERE "post_translations"."id" = ? LIMIT 1  [["id", 4]]
  SQL (0.2ms)  INSERT INTO "versions" ...
   (2.5ms)  commit transaction
 => #<Post id: 5, title: "zoot boot", content: "no way", access_count: nil, created_at: "2013-10-17 16:26:36", updated_at: "2013-10-17 16:26:36">

> p.title = 'change me'
 => "change me"

> p.save
   (0.1ms)  begin transaction
   (0.3ms)  UPDATE "posts" SET "title" = 'zoot boot', "updated_at" = '2013-10-17 16:30:37.591585' WHERE "posts"."id" = 5
  Post::Translation Load (0.1ms)  SELECT "post_translations".* FROM "post_translations" WHERE "post_translations"."post_id" = 5 AND "post_translations"."locale" = 'en' LIMIT 1
  Post::Translation Load (0.1ms)  SELECT "post_translations".* FROM "post_translations" WHERE "post_translations"."id" = ? LIMIT 1  [["id", 4]]
  SQL (0.2ms)  INSERT INTO "versions" ...
   (3.2ms)  commit transaction
 => true

> p.title
 => "zoot boot"
```

Not at all what we expected.

## models

#### Blog

```
translates :content, :title
has_paper_trail :ignores => [:access_count]
```

I created this model becuase I was having problems with paper_trail and the refinery blog engine when I would use ```:ignores => [:attribute]```.

#### Post

```
translates :content, title
has_paper_trail
```

Can update access_count but can't update the translated attributes.

#### Book

```
has_paper_trail
```

Model without translations. Works as expected.


## the bugs

* https://github.com/globalize/globalize/pull/206
* https://github.com/airblade/paper_trail/pull/203
* https://github.com/globalize/globalize/issues/117


