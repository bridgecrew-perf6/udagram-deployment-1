import {
	Table,
	Column,
	Model,
	PrimaryKey,
	CreatedAt,
	UpdatedAt,
} from 'sequelize-typescript';

@Table
export class User extends Model<User> {
	@PrimaryKey
	@Column
	public email!: string;

	@Column
	public passwordHash!: string;

	@Column
	@CreatedAt
	public createdAt: Date = new Date();

	@Column
	@UpdatedAt
	public updatedAt: Date = new Date();

	// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
	short() {
		return {
			email: this.email,
		};
	}
}
