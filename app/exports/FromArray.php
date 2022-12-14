<?php
/**
 * Created by PhpStorm.
 * Name: 芸众商城系统
 * Author: 广州市芸众信息科技有限公司
 * Profile: 广州市芸众信息科技有限公司位于国际商贸中心的广州，专注于移动电子商务生态系统打造，拥有芸众社交电商系统、区块链数字资产管理系统、供应链管理系统、电子合同等产品/服务。官网 ：www.yunzmall.com  www.yunzshop.com
 * Date: 2021/10/29
 * Time: 16:47
 */

namespace app\exports;

use Maatwebsite\Excel\Concerns\FromArray as BaseFromArray;
use Maatwebsite\Excel\Concerns\WithStyles;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;

class FromArray implements BaseFromArray, WithStyles
{
	private $data;

	public function __construct(array $data)
	{
		$this->data = $data;
	}

	public function array(): array
	{
		return $this->data;
	}

    /**
     * 样式设置
     * @param Worksheet $sheet
     */
    public function styles(Worksheet $sheet)
    {

    }
}