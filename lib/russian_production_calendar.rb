# frozen_string_literal: true

require 'date'
require 'csv'
require 'russian_production_calendar/version'
require 'russian_production_calendar/error'

module RussianProductionCalendar
  # Звездочкой (*) отмечены предпраздничные (сокращенные) дни.
  # Плюсом (+) отмечены перенесенные выходные дни
  CALENDAR_PATH = File.join('russian_production_calendar', 'calendar.csv')
  SHORTENED_POSTFIX = '*'
  WEEKEND_POSTPONED_POSTFIX = '+'
  DAY_SEP = ','
  YEAR_COL = 'Год/Месяц'

  MONTHS_MAP = {
    1 => 'Январь',
    2 => 'Февраль',
    3 => 'Март',
    4 => 'Апрель',
    5 => 'Май',
    6 => 'Июнь',
    7 => 'Июль',
    8 => 'Август',
    9 => 'Сентябрь',
    10 => 'Октябрь',
    11 => 'Ноябрь',
    12 => 'Декабрь'
  }.freeze

  extend self

  # @return [Boolean] true/false - выходной/рабочий
  def holiday?(date)
    days = index.dig(date.year, date.month) || raise(NotFoundError, date)
    days.include?(date.day)
  end

  # @return [Boolean]
  def workday?(date)
    !holiday?(date)
  end

  # @param [Date]
  # @return [Date] предыдущий рабочий день (или текущий, если он рабочий)
  def lte_workday(day)
    loop do
      workday?(day) ? (break day) : (day = day.prev_day)
    end
  end

  # @param [Date]
  # @return [Date] следующий рабочий день (или текущий, если он рабочий)
  def gte_workday(day)
    loop do
      workday?(day) ? (break day) : (day = day.next_day)
    end
  end

  # @param [Date]
  # @return [Date] следующий рабочий день
  def gt_workday(day)
    loop do
      day = day.next_day
      break day if workday?(day)
    end
  end

  # @param [Date]
  # @return [Date] предыдущий рабочий день
  def lt_workday(day)
    loop do
      day = day.prev_day
      break day if workday?(day)
    end
  end

  # @param [Date]
  # @return [Date] предыдущий выходной день (или текущий, если он выходной)
  def lte_holiday(day)
    loop do
      holiday?(day) ? (break day) : (day = day.prev_day)
    end
  end

  # @param [Date]
  # @return [Date] следующий выходной день (или текущий, если он выходной)
  def gte_holiday(day)
    loop do
      holiday?(day) ? (break day) : (day = day.next_day)
    end
  end

  # @param [Date]
  # @return [Date] следующий выходной день
  def gt_holiday(day)
    loop do
      day = day.next_day
      break day if holiday?(day)
    end
  end

  # @param [Date]
  # @return [Date] предыдущий рабочий день
  def lt_holiday(day)
    loop do
      day = day.prev_day
      break day if holiday?(day)
    end
  end

  private

  # @return [Hash([Integer] => Hash([Integer] => [Set]))]
  # @example {"2018" => { 1 => [1, 2, 3] }}
  def index
    @index ||= csv.each_with_object({}) do |row, object|
      year = Integer(row.fetch(YEAR_COL))

      object[year] = MONTHS_MAP.each_with_object({}) do |(ix, name), obj|
        obj[ix] = row.fetch(name).split(DAY_SEP).each_with_object(Set.new) do |day, result|
          result.add(Integer(day.delete(WEEKEND_POSTPONED_POSTFIX))) unless day[SHORTENED_POSTFIX]
        end
      end
    end
  end

  def csv
    CSV.open(File.join(__dir__, CALENDAR_PATH), headers: true).map(&:to_h)
  end
end
