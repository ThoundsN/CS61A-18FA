test = {
  'name': 'Python Basics',
  'points': 0,
  'suites': [
    {
      'cases': [
        {
          'code': r"""
          >>> 10 + 2
          12
          >>> 7 / 2
          3.5
          >>> 7 // 2
          3
          >>> 7 % 2			# 7 modulo 2, equivalent to the remainder of 7 // 2
          1
          """,
          'hidden': False,
          'locked': False
        }
      ],
      'scored': False,
      'type': 'wwpp'
    },
    {
      'cases': [
        {
          'code': r"""
          >>> x = 20
          >>> x + 2
          3d3ab69a0677d75a0ef4a99e0d2d1451
          # locked
          >>> x
          e1ac00f801290865dd772310ea7c60e4
          # locked
          >>> y = 5
          >>> y += 3			# Equivalent to y = y + 3
          >>> y * 2
          309984ef0dc06025a91b127042939a0e
          # locked
          >>> y /= 4			# Equivalent to y = y / 4
          >>> y + x
          3d3ab69a0677d75a0ef4a99e0d2d1451
          # locked
          """,
          'hidden': False,
          'locked': True
        }
      ],
      'scored': False,
      'type': 'wwpp'
    }
  ]
}
