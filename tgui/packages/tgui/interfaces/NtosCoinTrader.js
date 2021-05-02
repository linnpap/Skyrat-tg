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
  const [
    sortByField,
    setSortByField,
  ] = useLocalState(context, 'sortByField', null);
  return (
    <NtosWindow
      width={450}
      height={350}>
      <NtosWindow.Content>
        <Flex mx={-0.5} mb={1}>
          <Flex.Item mx={0.5} grow={1}>
		    <Section position="relative" height="100%">
			  <Chart.Line
				fillPositionedParent
				data={[0,7,1,3,1,7,1,8,1,7,2,7,1,8,3,7]}
				rangeX={[0, 9]}
				rangeY={[0, 10]}
				strokeColor="rgba(0, 181, 173, 1)"
				fillColor="rgba(0, 181, 173, 0.25)" />
			</Section>
          </Flex.Item>
		</Flex>
      </NtosWindow.Content>
    </NtosWindow>
  );
};
