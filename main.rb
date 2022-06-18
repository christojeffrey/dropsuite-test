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
end

# MAIN
bfs(PATH, content_count)
