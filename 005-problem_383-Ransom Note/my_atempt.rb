# this my attempt to solve the problem 383. Ransom Note
# https://leetcode.com/problems/ransom-note/

# makes 19ms (beats 97.67%) and 211.1 MB (beats 50.67%)

# Just by looking you can see that it works but it is not the best solution

# @param {String} ransom_note
# @param {String} magazine
# @return {Boolean}
def can_construct(ransom_note, magazine)
    ransom_note.each_char do |c|
        r_c = ransom_note.count(c)
        m_c = magazine.count(c)
        return false if r_c > m_c
    end
    true
end

# Afeter ask AI for a solution, I has some thoughts and came up with another one:
# This solution 25ms and beats 90% however uses more memory: 260, beats only 5.33%, but performer batter and IA solution
def can_construct(ransom_note, magazine)
    magazine_sub_s = magazine

    ransom_note.each_char do |c|
        new_sub_s = magazine_sub_s.sub(c, '')
        return false if new_sub_s == magazine_sub_s
        magazine_sub_s = new_sub_s
    end
    true
end

# Asked IA to improve the solution above and got this
# The ai solution is severely worse than mine in time and memory
# however it is more elegant and probabli better for bigger datasets

def can_construct(ransom_note, magazine)
    mag_chars = magazine.chars

    ransom_note.each_char do |c|
        index = mag_chars.index(c)
        return false if index.nil?
        mag_chars.delete_at(index)
    end
    true
end

# And this last one, also worse than mine in time and memory but elegant, howver mucho more elegant than mine
def can_construct(ransom_note, magazine)
    mag_copy = magazine.dup

    ransom_note.each_char do |c|
        return false unless mag_copy.sub!(c, '')
    end
    true
end

#
