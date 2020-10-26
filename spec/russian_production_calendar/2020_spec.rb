RSpec.describe '2020' do
  let(:holidays) do
    %w[
      01.01.2020
      02.01.2020
      03.01.2020
      04.01.2020
      05.01.2020
      06.01.2020
      07.01.2020
      08.01.2020
      11.01.2020
      12.01.2020
      18.01.2020
      19.01.2020
      25.01.2020
      26.01.2020

      01.02.2020
      02.02.2020
      08.02.2020
      09.02.2020
      15.02.2020
      16.02.2020
      22.02.2020
      23.02.2020
      24.02.2020
      29.02.2020

      01.03.2020
      07.03.2020
      08.03.2020
      09.03.2020
      14.03.2020
      15.03.2020
      21.03.2020
      22.03.2020
      28.03.2020
      29.03.2020

      04.04.2020
      05.04.2020
      11.04.2020
      12.04.2020
      18.04.2020
      19.04.2020
      25.04.2020
      26.04.2020

      01.05.2020
      02.05.2020
      03.05.2020
      04.05.2020
      05.05.2020
      09.05.2020
      10.05.2020
      11.05.2020
      16.05.2020
      17.05.2020
      23.05.2020
      24.05.2020
      30.05.2020
      31.05.2020

      06.06.2020
      07.06.2020
      12.06.2020
      13.06.2020
      14.06.2020
      20.06.2020
      21.06.2020
      27.06.2020
      28.06.2020

      04.07.2020
      05.07.2020
      11.07.2020
      12.07.2020
      18.07.2020
      19.07.2020
      25.07.2020
      26.07.2020

      01.08.2020
      02.08.2020
      08.08.2020
      09.08.2020
      15.08.2020
      16.08.2020
      22.08.2020
      23.08.2020
      29.08.2020
      30.08.2020

      05.09.2020
      06.09.2020
      12.09.2020
      13.09.2020
      19.09.2020
      20.09.2020
      26.09.2020
      27.09.2020

      03.10.2020
      04.10.2020
      10.10.2020
      11.10.2020
      17.10.2020
      18.10.2020
      24.10.2020
      25.10.2020
      31.10.2020

      01.11.2020
      04.11.2020
      07.11.2020
      08.11.2020
      14.11.2020
      15.11.2020
      21.11.2020
      22.11.2020
      28.11.2020
      29.11.2020

      05.12.2020
      06.12.2020
      12.12.2020
      13.12.2020
      19.12.2020
      20.12.2020
      26.12.2020
      27.12.2020
    ].map(&Date.method(:parse))
  end

  let(:year) do
    Range.new(Date.new(2020, 1, 1), Date.new(2020, 12, 31)).to_a
  end

  it 'works for holidays' do
    expect(year.select(&:holiday?)).to eq(holidays)
  end

  it 'works for workdays' do
    expect(year.select(&:workday?)).to eq(year - holidays)
  end
end
