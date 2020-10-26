RSpec.describe RussianProductionCalendar do
  describe '#gte_workday' do
    context 'when holiday' do
      it 'works' do
        expect(Date.parse('01.01.2020').gte_workday).to eq(Date.parse('09.01.2020'))
      end
    end

    context 'when workday' do
      it 'works' do
        expect(Date.parse('09.01.2020').gte_workday).to eq(Date.parse('09.01.2020'))
      end
    end
  end

  describe '#lte_workday' do
    context 'when holiday' do
      it 'works' do
        expect(Date.parse('01.01.2020').lte_workday).to eq(Date.parse('31.12.2019'))
      end
    end

    context 'when workday' do
      it 'works' do
        expect(Date.parse('09.01.2020').lte_workday).to eq(Date.parse('09.01.2020'))
      end
    end
  end

  describe '#gt_workday' do
    context 'when holiday' do
      it 'works' do
        expect(Date.parse('11.01.2020').gt_workday).to eq(Date.parse('13.01.2020'))
      end
    end

    context 'when workday' do
      it 'works' do
        expect(Date.parse('13.01.2020').gt_workday).to eq(Date.parse('14.01.2020'))
      end
    end
  end

  describe '#lt_workday' do
    context 'when holiday' do
      it 'works' do
        expect(Date.parse('12.01.2020').lt_workday).to eq(Date.parse('10.01.2020'))
      end
    end

    context 'when workday' do
      it 'works' do
        expect(Date.parse('10.01.2020').lt_workday).to eq(Date.parse('09.01.2020'))
      end
    end
  end

  describe '#gte_holiday' do
    context 'when holiday' do
      it 'works' do
        expect(Date.parse('01.01.2020').gte_holiday).to eq(Date.parse('01.01.2020'))
      end
    end

    context 'when workday' do
      it 'works' do
        expect(Date.parse('31.12.2019').gte_holiday).to eq(Date.parse('01.01.2020'))
      end
    end
  end

  describe '#lte_holiday' do
    context 'when holiday' do
      it 'works' do
        expect(Date.parse('01.01.2020').lte_holiday).to eq(Date.parse('01.01.2020'))
      end
    end

    context 'when workday' do
      it 'works' do
        expect(Date.parse('10.01.2020').lte_holiday).to eq(Date.parse('08.01.2020'))
      end
    end
  end

  describe '#gt_holiday' do
    context 'when holiday' do
      it 'works' do
        expect(Date.parse('01.01.2020').gt_holiday).to eq(Date.parse('02.01.2020'))
      end
    end

    context 'when workday' do
      it 'works' do
        expect(Date.parse('09.01.2020').gt_holiday).to eq(Date.parse('11.01.2020'))
      end
    end
  end

  describe '#lt_holiday' do
    context 'when holiday' do
      it 'works' do
        expect(Date.parse('01.01.2020').lt_holiday).to eq(Date.parse('29.12.2019'))
      end
    end

    context 'when workday' do
      it 'works' do
        expect(Date.parse('09.01.2020').lt_holiday).to eq(Date.parse('08.01.2020'))
      end
    end
  end

  context 'when date is out of range' do
    it 'errors' do
      expect { Date.parse('01.01.1945').gt_workday }.to raise_error(RussianProductionCalendar::NotFoundError)
    end
  end
end
