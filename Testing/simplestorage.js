const SimpleStorage = artifacts.require("SimpleStorage");

contract("SimpleStorage", accounts => {

  const owner = accounts[0];
  const user = accounts[1];

  beforeEach( async function() {
    simpleStorage = await SimpleStorage.deployed();
  });

  it("Check value when deployed", async () => {

    const expectedValue = 0;

    const value = await simpleStorage.get.call();
    assert.equal(value, expectedValue, "When deployed value must be 0!")

  });

  it("Set() with user/owner and check value", async () => {
    
    const valueSet = 3;
    const expectedValue = 3;
    
    const valueSetOwner = 31;
    const expectedValueOwner = 31;

    await simpleStorage.set(valueSet, {from: user});
    const value = await simpleStorage.get.call();
    
    assert.equal( value, expectedValue, "Set() function error");

    await simpleStorage.set(valueSetOwner,{from: owner});
    const valueOwner = await simpleStorage.get.call();
    
    assert.equal( valueOwner, expectedValueOwner, "Set() function error");

  });

  it("Set() with owner and check value", async () => {
    
    const valueSet = 77;
    const expectedValue = 77;

    await simpleStorage.setOwner(valueSet, {from: owner});
    const value = await simpleStorage.get.call();

    assert.equal(value, expectedValue, "SetOwner() error");
    
  });

  it("SetOwner() with no-owner and check value", async () => {
    
    const valueSet = 77;
    const expectedValue = 77;

    try {
      await simpleStorage.setOwner(valueSet, {from: accounts[1]});
    } catch (error) {
      err = error;
    }
    assert.ok(err instanceof Error);

    const value = await simpleStorage.get.call();
    assert.equal(value, expectedValue, "SetOwner() error");

  });
});