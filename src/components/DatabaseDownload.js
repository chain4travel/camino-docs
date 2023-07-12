import React from 'react';

const LatestCaminoDB = ( { previous = 0, network = "camino", onlyurl = "false" }) => {
  const today = new Date();

  var yyyy = today.getUTCFullYear().toString()
  var yy = yyyy.substr(-2)
  var mm = ("0" + (today.getUTCMonth() + 1)).slice(-2)
  var dd = ("0" + today.getUTCDate()).slice(-2)
  

  var tarballTimeFormat = yyyy + "-" + mm + "-" + dd + "T06:00:00+00:00"
  var tarballTime = new Date(Date.parse(tarballTimeFormat))

  var todayEpoch = today.getTime()
  var tarballEpoch = tarballTime.getTime()

  if (todayEpoch < tarballEpoch) {
    today.setDate(today.getDate() - 1)
  }

  if (previous > 1) {
    today.setDate(today.getDate() - previous)
    var old = "(" + previous + " days old)"
  } else if (previous == 1) {
    today.setDate(today.getDate() - previous)
    var old = "(1 day old)"
  } else {
    var old = "(latest)"
  }
 
  var yyyy = today.getUTCFullYear().toString()
  var yy = yyyy.substr(-2)
  var mm = ("0" + (today.getUTCMonth() + 1)).slice(-2)
  var dd = ("0" + today.getUTCDate()).slice(-2)

  var urlPrefix = "https://storage.googleapis.com/" + network + "-db-tarballs/" + network + "_db_"
  var urlSuffix = ".tar.gz"

  var tarballURL = urlPrefix + yy + mm + dd + urlSuffix

  var tarballDate = yyyy + "-" + mm + "-" + dd
  
  //return <span class="tarball-url">{tarballDate}: <a href={tarballURL}>{tarballURL}</a> {old}</span>;

  if (onlyurl == "true") {
    return <span>{tarballURL}</span>;
  } else {
    return <span class="tarball-url"><a href={tarballURL}>{tarballURL}</a> {old}</span>;
  }
};

export default LatestCaminoDB;
