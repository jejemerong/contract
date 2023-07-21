import { expect } from 'chai'
import { ethers } from 'hardhat'

describe('Array Contract', () => {
  it('Is the element of array assigned ?', async () => {
    const [owner, addr1, addr2] = await ethers.getSigners()

    const hardhatToken = await ethers.deployContract('Array')

    await hardhatToken.example()
    // expect(await hardhatToken.balaneOf(addr1.address)).to.equal(50)

    // owner 외의 EOA 에서 다른 EOA 로 출금할 경우, connect 함수 사용
    // await hardhatToken.connect(addr1).transfer(addr2.address, 50)
    // expect(await hardhatToken.balaneOf(addr2.address)).to.equal(50)
  })
})
