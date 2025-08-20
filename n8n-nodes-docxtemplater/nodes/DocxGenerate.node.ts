import { IExecuteFunctions } from 'n8n-workflow';
import { INodeType, INodeTypeDescription, INodeExecutionData } from 'n8n-workflow';
import PizZip from 'pizzip';
import Docxtemplater from 'docxtemplater';

export class DocxGenerate implements INodeType {
	description: INodeTypeDescription = {
		displayName: 'Docx Generate',
		name: 'docxGenerate',
		icon: 'fa:file-word',
		group: ['transform'],
		version: 1,
		description: 'Generate a DOCX file from a template and JSON data',
		defaults: {
			name: 'Docx Generate',
		},
		inputs: ['main'],
		outputs: ['main'],
		properties: [
			{
				displayName: 'Template (Base64)',
				name: 'template',
				type: 'string',
				default: '',
				required: true,
				description: 'The DOCX template in Base64 encoding',
			},
			{
				displayName: 'Variables (JSON)',
				name: 'variables',
				type: 'json',
				default: '{}',
				description: 'Key-value pairs to inject into the template',
			},
		],
	};

	async execute(this: IExecuteFunctions): Promise<INodeExecutionData[][]> {
		const items = this.getInputData();
		const returnData: INodeExecutionData[] = [];

		for (let i = 0; i < items.length; i++) {
			const templateBase64 = this.getNodeParameter('template', i) as string;
			const variables = this.getNodeParameter('variables', i, {}) as Record<string, unknown>;

			const buffer = Buffer.from(templateBase64, 'base64');
			const zip = new PizZip(buffer);
			const doc = new Docxtemplater(zip, { paragraphLoop: true, linebreaks: true });

			doc.render(variables);

			const out = doc.getZip().generate({ type: 'nodebuffer' });

			returnData.push({
				json: { success: true },
				binary: {
					data: await this.helpers.prepareBinaryData(out, 'output.docx'),
				},
			});
		}

		return [returnData];
	}
}
