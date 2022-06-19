# CONFIG
PATH = './data'


# DECLARE VARIABLE

# create a hash map to track content count. use hash because it is faster than array for lookup.
content_count = Hash.new 0

# SUBPROGRAM

# idealy, time complexity should be O(n) where n is the number of files in the directory.
# bfs should be pretty close, without using a lot of time.
# bfs with a little memo
def bfs(path, content_count)
    # create a queue to store the path
    queue = []
    # push the path into the queue
    queue.push path
    # while the queue is not empty
    while queue.length > 0
        # pop the path from the queue
        path = queue.shift
        # check if path is folder
        if File.directory? path
            # push every file and folder in the folder into the queue
            Dir.foreach(path) do |file|
                # ignore . and ..
                next if file == '.' or file == '..'
                # push the path into the queue
                queue.push path + '/' + file
            end
        else
            # increment the count of the content
            content_count[File.read(path)] += 1
        end
    end
end

# MAIN
bfs(PATH, content_count)

# get the key for the largest value
largest_value = content_count.max_by { |k, v| v }
# print the key and value
puts "#{largest_value[0]} #{largest_value[1]}"
