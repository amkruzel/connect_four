# frozen_string_literal: true

# this module contains information and methods to 'draw' the board
module BoardDisplay
  def display_board
    puts @cur_board
  end

  private

  def board(ary)
    <<~BOARD
      \t╔═════════════════════════════╗
      \t║ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ║
      \t║ │#{ary[0][0]}│ │#{ary[0][1]}│ │#{ary[0][2]}│ │#{ary[0][3]}│ │#{ary[0][4]}│ │#{ary[0][5]}│ │#{ary[0][6]}│ ║
      \t║ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ║
      \t║ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ║
      \t║ │#{ary[1][0]}│ │#{ary[1][1]}│ │#{ary[1][2]}│ │#{ary[1][3]}│ │#{ary[1][4]}│ │#{ary[1][5]}│ │#{ary[1][6]}│ ║
      \t║ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ║
      \t║ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ║
      \t║ │#{ary[2][0]}│ │#{ary[2][1]}│ │#{ary[2][2]}│ │#{ary[2][3]}│ │#{ary[2][4]}│ │#{ary[2][5]}│ │#{ary[2][6]}│ ║
      \t║ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ║
      \t║ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ║
      \t║ │#{ary[3][0]}│ │#{ary[3][1]}│ │#{ary[3][2]}│ │#{ary[3][3]}│ │#{ary[3][4]}│ │#{ary[3][5]}│ │#{ary[3][6]}│ ║
      \t║ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ║
      \t║ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ║
      \t║ │#{ary[4][0]}│ │#{ary[4][1]}│ │#{ary[4][2]}│ │#{ary[4][3]}│ │#{ary[4][4]}│ │#{ary[4][5]}│ │#{ary[4][6]}│ ║
      \t║ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ║
      \t║ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ║
      \t║ │#{ary[5][0]}│ │#{ary[5][1]}│ │#{ary[5][2]}│ │#{ary[5][3]}│ │#{ary[5][4]}│ │#{ary[5][5]}│ │#{ary[5][6]}│ ║
      \t║ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ║
      \t╠═════════════════════════════╣
      \t║ (1) (2) (3) (4) (5) (6) (7) ║
      \t╨                             ╨

    BOARD
  end
end


##
## This is what the board will actually look like
##
##  ╔═════════════════════════════╗
##  ║ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ║
##  ║ │ │ │ │ │ │ │ │ │ │ │ │ │ │ ║
##  ║ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ║
##  ║ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ║
##  ║ │ │ │ │ │ │ │ │ │ │ │ │ │ │ ║
##  ║ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ║
##  ║ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ║
##  ║ │ │ │ │ │ │ │ │ │ │ │ │ │ │ ║
##  ║ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ║
##  ║ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ║
##  ║ │ │ │ │ │ │ │ │ │ │ │ │ │ │ ║
##  ║ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ║
##  ║ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ║
##  ║ │ │ │ │ │ │ │ │ │ │ │ │ │ │ ║
##  ║ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ║
##  ║ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ╭─╮ ║
##  ║ │ │ │ │ │ │ │ │ │ │ │ │ │ │ ║
##  ║ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ╰─╯ ║
##  ╠═════════════════════════════╣
##  ║                             ║
##  ╨                             ╨