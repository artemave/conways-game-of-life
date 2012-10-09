require 'ncurses'

class ScreenDriver
  at_exit do
    Ncurses.endwin
    Ncurses.curs_set 1
  end

  def initialize
    Ncurses.initscr

    Ncurses.nl
    Ncurses.noecho
    Ncurses.curs_set 0
    Ncurses.stdscr.nodelay true
  end

  def draw_char row, col, char
    Ncurses.mvaddstr(row, col, char);
    Ncurses.refresh
  end

  def clear_screen
    Ncurses.stdscr.clear
  end

  def max_x
    Ncurses.stdscr.getmaxx
  end

  def max_y
    Ncurses.stdscr.getmaxy
  end
end
