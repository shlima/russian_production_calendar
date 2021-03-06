# @refs http://www.consultant.ru/law/ref/calendar/proizvodstvennye/2021/
RSpec.describe '2021' do
  let(:holidays) do
    %w[
      01.01.2021
      02.01.2021
      03.01.2021
      04.01.2021
      05.01.2021
      06.01.2021
      07.01.2021
      08.01.2021
      09.01.2021
      10.01.2021
      16.01.2021
      17.01.2021
      23.01.2021
      24.01.2021
      30.01.2021
      31.01.2021

      06.02.2021
      07.02.2021
      13.02.2021
      14.02.2021
      21.02.2021
      22.02.2021
      23.02.2021
      27.02.2021
      28.02.2021

      06.03.2021
      07.03.2021
      08.03.2021
      13.03.2021
      14.03.2021
      20.03.2021
      21.03.2021
      27.03.2021
      28.03.2021

      03.04.2021
      04.04.2021
      10.04.2021
      11.04.2021
      17.04.2021
      18.04.2021
      24.04.2021
      25.04.2021

      01.05.2021
      02.05.2021
      03.05.2021
      08.05.2021
      09.05.2021
      10.05.2021
      15.05.2021
      16.05.2021
      22.05.2021
      23.05.2021
      29.05.2021
      30.05.2021

      05.06.2021
      06.06.2021
      12.06.2021
      13.06.2021
      14.06.2021
      19.06.2021
      20.06.2021
      26.06.2021
      27.06.2021

      03.07.2021
      04.07.2021
      10.07.2021
      11.07.2021
      17.07.2021
      18.07.2021
      24.07.2021
      25.07.2021
      31.07.2021

      01.08.2021
      07.08.2021
      08.08.2021
      14.08.2021
      15.08.2021
      21.08.2021
      22.08.2021
      28.08.2021
      29.08.2021

      04.09.2021
      05.09.2021
      11.09.2021
      12.09.2021
      18.09.2021
      19.09.2021
      25.09.2021
      26.09.2021

      02.10.2021
      03.10.2021
      09.10.2021
      10.10.2021
      16.10.2021
      17.10.2021
      23.10.2021
      24.10.2021
      30.10.2021
      31.10.2021

      04.11.2021
      05.11.2021
      06.11.2021
      07.11.2021
      13.11.2021
      14.11.2021
      20.11.2021
      21.11.2021
      27.11.2021
      28.11.2021

      04.12.2021
      05.12.2021
      11.12.2021
      12.12.2021
      18.12.2021
      19.12.2021
      25.12.2021
      26.12.2021
      31.12.2021
    ].map(&Date.method(:parse))
  end

  let(:year) do
    days_of_year(2021)
  end

  it 'works for holidays' do
    expect(year.select(&:holiday?)).to eq(holidays)
  end

  it 'works for workdays' do
    expect(year.select(&:workday?)).to eq(year - holidays)
  end
end
