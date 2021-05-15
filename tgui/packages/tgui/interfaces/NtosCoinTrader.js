import { map, sortBy } from 'common/collections';
import { flow } from 'common/fp';
import { toFixed } from 'common/math';
import { pureComponentHooks } from 'common/react';
import { useBackend, useLocalState } from '../backend';
import { resolveAsset } from '../assets';
import { AnimatedNumber, Box, Button, Chart, Flex, Grid, LabeledList, Section } from '../components';
import { NtosWindow } from '../layouts';

export const NtosCoinTrader = (props, context) => {
  const { act, data } = useBackend(context);
  const { crypto_price } = data;
  const { crypto_price_history } = data;
  const { crypto_trend } = data;
  const [
    sortByField,
    setSortByField,
  ] = useLocalState(context, 'sortByField', null);
  const cryptoprice_graph = crypto_price_history.map((value, i) => [i, value]);
  const minValue = Math.min(...crypto_price_history);
  const maxValue = Math.max(...crypto_price_history);
  return (
    <NtosWindow
      width={450}
      height={400}>
      <NtosWindow.Content>
		<Section height={8} width='70%'>
		  title='{crypto_trend}'
		  <Chart.Line
			height={8}
			fillPositionedParent
			data={cryptoprice_graph}
			rangeX={[0, 39]}
			rangeY={[minValue-1, maxValue+1]}
			strokeColor="rgba(0, 181, 173, 1)"/>
		</Section>
		<Button
          //icon="fist-raised"
          tooltip='Buy Crypto'
          tooltipPosition="bottom"
          //disabled={data.GameActive === 0 || data.PauseState === 1}
          onClick={() => act('buyCrypto')}
          content="Buy" />
		<Button
          //icon="fist-raised"
          tooltip="Sell Crypto"
          tooltipPosition="bottom"
          //disabled={data.GameActive === 0 || data.PauseState === 1}
          onClick={() => act('sellCrypto')}
          content="Sell" />
      </NtosWindow.Content>
    </NtosWindow>
  );
};
