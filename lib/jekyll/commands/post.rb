module Jekyll
  module Commands
    class Post < Command

      class << self

        def init_with_program(prog)
          prog.command(:post) do |c|
            c.syntax 'post "TITLE"'
            c.description "Create a new jekyll post"

            c.action do |args|
              Jekyll::Commands::Post.process(args)
            end
          end
        end

        def process(args)
          raise ArgumentError.new('You must specify a post title.') if args.empty?
          FileUtils.touch(initialize_post_name(args))
        end

        def initialize_post_name(args)
          post_time = Time.now.strftime("%Y-%m-%d")
          post_name = args[0].split(' ').join('-') 

          "_posts/#{post_time}-#{post_name}.md"
        end

      end

    end
  end
end
