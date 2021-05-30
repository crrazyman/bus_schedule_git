var request = require('supertest');
var express = require('express');

var app = require('../app');

describe('Index Page', function() {
  it("renders successfully", function(done) {
    request(app).get('/').expect(200, done);
  })
})

describe('Buses API', function() {
  it("returns data successfully", function(done) {
    request(app).get('/buses').expect(200).expect('Content-Length', '1050').expect('Content-Type', /json/, done); ;
  })
})