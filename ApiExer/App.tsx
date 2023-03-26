/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 */

import React, { useEffect, useState } from 'react';
import {
  ActivityIndicator,
  FlatList,
  Image,
  SafeAreaView,
  StyleSheet,
  Text,
  TouchableOpacity,
  View,
} from 'react-native';
import Logo from './assets/image/2748558.png';

const App = () => {
  const [data, setData] = useState([]);
  const [isLoading, setIsLoading] = useState(false);
  const [selectedItem, setSelectedItem] = useState(null);

  const getData = () => {
    setIsLoading(true);
    const apiURL = 'https://testnets-api.opensea.io/api/v1/assets';
    fetch(apiURL)
      .then(res => res.json())
      .then(resJson => {
        setData(resJson.assets);
        setIsLoading(true);
      })
      .catch(error => {
        console.log(error);
      })
      .finally(() => setIsLoading(false));
  };

  const renderDetails = () => {
    return (
      <View style={styles.detailsContainer}>
        <Text style={styles.detailsTitle}>{selectedItem.name}</Text>
        {selectedItem.image_url !== null ? (<Image
            style={styles.detailsImage}
            source={{uri: selectedItem.image_url}}
            resizeMode="contain"
          />
        ) : (
          <Image
            style={styles.detailsImage}
            source={Logo}
            resizeMode="contain"
          />
        )}
        <Text style={styles.detailsText}>{selectedItem.description}</Text>
        <TouchableOpacity
          style={styles.detailsButton}
          onPress={() => setSelectedItem(null)}>
          <Text style={styles.detailsButtonText}>Close</Text>
        </TouchableOpacity>
      </View>
    );
  };

  const renderItem = ({item}) => {
    if (item.image_url === null) {
      return (
        <TouchableOpacity
          style={styles.item}
          onPress={() => setSelectedItem(item)}>
          <Image style={styles.logo} source={Logo} resizeMode="contain" />
          {item.name !== null ?
        (<Text style={styles.itemText}>{item.name}</Text>) : (<Text style={styles.itemText}>Not found!</Text>)}
        </TouchableOpacity>
      );
    }
    return (
      <TouchableOpacity
        style={styles.item}
        onPress={() => setSelectedItem(item)}>
        <Image
          style={styles.logo}
          source={{uri: item.image_url}}
          resizeMode="contain"
        />
        {item.name !== null ?
        (<Text style={styles.itemText}>{item.name}</Text>) : (<Text style={styles.itemText}>Not found!</Text>)}
      </TouchableOpacity>
    );
  };

  const handleLoad = () => {
    setIsLoading(false);
    getData();
  };

  return (
    <SafeAreaView style={styles.container}>
      <View style={styles.group}>
        <TouchableOpacity style={styles.button} onPress={handleLoad}>
          <Text style={styles.buttonText}>Load</Text>
        </TouchableOpacity>
      </View>
      {isLoading ? (
        <ActivityIndicator />
      ) : selectedItem ? (
        renderDetails()
      ) : (
        <FlatList
          style={styles.list}
          data={data}
          renderItem={renderItem}
          keyExtractor={(item) => item.id.toString()}
        />
      )}
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: 'pink',
  },
  group: {
    marginVertical: 20,
    paddingHorizontal: 10,
  },
  button: {
    backgroundColor: '#007AFF',
    borderRadius: 5,
    paddingVertical: 10,
    paddingHorizontal: 20,
  },
  buttonText: {
    color: '#FFFFFF',
    fontSize: 18,
    fontWeight: 'bold',
  },
  list: {
    flex: 1,
    width: '100%',
    paddingHorizontal: 10,
  },
  item: {
    flexDirection: 'column',
    marginVertical: 10,
    padding: 100,
    borderRadius: 5,
    backgroundColor: '#FFFFFF',
    alignItems: 'center',
  },
  logo: {
    width: 300,
    height: 300,
    marginRight: 10,
  },
  itemText: {
    paddingTop: 20,
    fontSize: 20,
  },
  noDataText: {
    fontSize: 18,
    fontWeight: 'bold',
    color: '#999999',
  },
  detailsContainer: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
    width: '100%',
  },
  detailsImage: {
    width: 200,
    height: 200,
    marginVertical: 20,
    borderRadius: 10,
    backgroundColor: '#f2f2f2',
    justifyContent: 'center',
    alignItems: 'center',
  },
  detailsText: {
    fontSize: 20,
    marginVertical: 10,
    textAlign: 'center',
  },
  detailsButton: {
    backgroundColor: '#0080ff',
    paddingHorizontal: 20,
    paddingVertical: 10,
    borderRadius: 5,
    marginTop: 20,
  },
  detailsButtonText: {
    color: '#fff',
    fontSize: 18,
    fontWeight: 'bold',
  },
  detailsTitle: {
    fontSize: 18,
  },
});

export default App;
