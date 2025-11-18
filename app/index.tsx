import { Text, View } from "react-native";
import '../styles/global.css'

export default function Index() {
  return (
    <View className={'flex items-center justify-center bg-red-300'}>
      <Text className={'text-lg'}>View Timer</Text>
    </View>
  );
}
