# The ai solution is severely worse than mine in time and memory
# however it is more elegant and probabli better for bigger datasets

# @param {String} ransom_note
# @param {String} magazine
# @return {Boolean}
def can_construct(ransom_note, magazine)
    mag_count = Hash.new(0)

    magazine.each_char { |c| mag_count[c] += 1 }

    ransom_note.each_char do |c|
        return false if mag_count[c] == 0
        mag_count[c] -= 1
    end

    true
end
